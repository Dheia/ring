# Form/Window View - Generated Source Code File 
# Generated by the Ring 1.10 Form Designer
# Date : 07/02/2019
# Time : 06:53:14

Load "stdlibcore.ring"
Load "guilib.ring"

import System.GUI

if IsMainSourceFile() { 
	new App {
		StyleFusion()
		new frm3View { win.show() } 
		exec()
	}
}

class frm3View from WindowsViewParent
	win = new MainWindow() { 
		move(20,20)
		resize(400,400)
		setWindowTitle("Form1")
		setstylesheet("background-color:;") 
		Label1 = new label(win) {
			move(93,31)
			resize(247,55)
			setstylesheet("color:black;background-color:;")
			oFont = new qfont("",0,0,0)
			oFont.fromstring("MS Shell Dlg 2,22,-1,5,50,0,0,0,0,0")
			setfont(oFont)
			oFont.delete()
			setText("Form 3")
			setAlignment(Qt_AlignLeft |  Qt_AlignVCenter)
		}
		btnClose = new pushbutton(win) {
			move(83,164)
			resize(261,58)
			setstylesheet("color:black;background-color:;")
			oFont = new qfont("",0,0,0)
			oFont.fromstring("MS Shell Dlg 2,14,-1,5,50,0,0,0,0,0")
			setfont(oFont)
			oFont.delete()
			setText("Close")
			setClickEvent(Method(:btnClose_click))
			setBtnImage(btnClose,"")
			
		}
	}

# End of the Generated Source Code File...