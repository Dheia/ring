# Form/Window View - Generated Source Code File 
# Generated by the Ring 1.10 Form Designer
# Date : 15/02/2019
# Time : 20:05:53

Load "stdlibcore.ring"
Load "guilib.ring"

import System.GUI

if IsMainSourceFile() { 
	new App {
		StyleFusion()
		new frmView { win.show() } 
		exec()
	}
}

class frmView from WindowsViewParent
	win = new MainWindow() { 
		move(20,20)
		resize(889,518)
		setWindowTitle("Form1")
		setstylesheet("background-color:;") 
		TreeWidget1 = new treewidget(win) {
			move(217,18)
			resize(394,371)
			setstylesheet("color:black;background-color:white;")
			oFont = new qfont("",0,0,0)
			oFont.fromstring("MS Shell Dlg 2,16,-1,5,50,0,0,0,0,0")
			setfont(oFont)
			oFont.delete()
			setColumnCount(0)
			setHeaderHidden(True)
			setcollapsedEvent("")
			setexpandedEvent("")
			setactivatedEvent("")
			setclickedEvent("")
			setdoubleClickedEvent("")
			setenteredEvent("")
			setpressedEvent("")
			setviewportEnteredEvent("")
			setcurrentItemChangedEvent("")
			setitemActivatedEvent("")
			setitemChangedEvent("")
			setitemClickedEvent("")
			setitemCollapsedEvent("")
			setitemDoubleClickedEvent("")
			setitemEnteredEvent("")
			setitemExpandedEvent("")
			setitemPressedEvent("")
			setitemSelectionChangedEvent("")
			
		}
		btnFillTree = new pushbutton(win) {
			move(218,415)
			resize(395,49)
			setstylesheet("color:black;background-color:;")
			oFont = new qfont("",0,0,0)
			oFont.fromstring("MS Shell Dlg 2,16,-1,5,50,0,0,0,0,0")
			setfont(oFont)
			oFont.delete()
			setText("Fill Tree")
			setClickEvent(Method(:btnFillTree_Click))
			setBtnImage(btnFillTree,"")
			
		}
	}

# End of the Generated Source Code File...