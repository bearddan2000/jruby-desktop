#!/usr/bin/env jruby

require 'java'

java_import 'java.awt.FlowLayout'
java_import 'java.awt.Dimension'
java_import 'java.awt.event.ActionListener'
java_import 'java.awt.event.ItemListener'

java_import 'javax.swing.JComboBox'
java_import 'javax.swing.JFrame'
java_import 'javax.swing.JLabel'
java_import 'javax.swing.JButton'

$x = 1
$y = 1
$z = '+'
$label = JLabel.new

class ItemChange
  include ItemListener

    def itemStateChanged(event)
      box = event.source
      item = box.get_selected_item
      case box.name
      when 'x'
        $x = item
      when 'y'
        $y = item
      else
        $z = item
      end
    end
end

class ButtonClick
  include ActionListener

  def actionPerformed(event)
    text = ''
    case $z
    when '+'
      text = $x + $y
    when '-'
      text = $x - $y
    when '*'
      text = $x * $y
    else
      text = $x / $y
    end
    $label.text = "#{text}"
  end
end

def figureBox(name)
  fig = Array (1..9)
  box = JComboBox.new
  fig.each { |x| box.add_item x }
  box.name = name
  box.addItemListener ItemChange.new
  return box
end

def operationBox()
  opts = ['+','-','*','/']
  box = JComboBox.new
  box.name = 'z'
  box.addItemListener ItemChange.new
  opts.each { |x| box.add_item x }
  return box
end

def createButton()
  btn = JButton.new
  btn.text = '='
  btn.addActionListener ButtonClick.new
  return btn
end

frame = JFrame.new 'JRuby Desktop'
frame.size = Dimension.new 250, 75
frame.layout = FlowLayout.new

frame.add figureBox('x')
frame.add operationBox()
frame.add figureBox('y')
frame.add createButton()
frame.add $label

frame.setDefaultCloseOperation JFrame::EXIT_ON_CLOSE
frame.visible = true
