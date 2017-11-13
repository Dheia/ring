/*
**	Application : Ring To Executable 
**	Purpose	    : Convert Ring project source code to executable file 
**		      (Windows, Linux & MacOS X)
**	Author	    : Mahmoud Fayed <msfclipper@yahoo.com>
**	Date	    : 2017.11.06
*/

/*
	Usage

		ring ring2exe.ring filename.ring  [Options]
		This will set filename.ring as input to the program 	

		The next files will be generated 
		filename.ringo	  (The Ring Object File - by Ring Compiler)
		filename.c	  (The C Source code file
				   Contains the ringo file content
				   Will be generated by this program)
		filename_buildvc.bat (Will be executed to build filename.c using Visual C/C++)
		filename_buildgcc.bat (Will be executed to build filename.c using GNU C/C++)
		filename_buildclang.bat (Will be executed to build filename.c using CLang C/C++)
		filename.obj	  (Will be generated by the Visual C/C++ compiler) 
		filename.exe 	  (Will ge generated by the Visual C/C++ Linker)
		filename	  (Executable File - On Linux & MacOS X platforms)

	Note
		We can use 
			ring ring2exe.ring ring2exe.ring 
		This will build ring2exe.exe
		We can use ring2exe.exe 

		ring2exe filename.ring 

		Or (Linux & MacOS X)

		./ring2exe filename.ring

	Testing 	
	
		ring2exe test.ring 
		test 

		Or (Linux & MacOS X)

		./ring2exe test.ring 
		./test

	Options

		-keep       	 : Don't delete Temp. Files
		-static     	 : Build Standalone Executable File (Don't use ring.dll/ring.so/ring.dylib)
		-gui        	 : Build GUI Application (Hide the Console Window)
		-dist	    	 : Prepare application for distribution 
		-allruntime 	 : Include all libraries in distribution
		-noqt	    	 : Remove RingQt from distribution
		-noallegro 	 : Remove RingAllegro from distribution
		-noopenssl  	 : Remove RingOpenSSL from distribution
		-nolibcurl  	 : Remove RingLibCurl from distribution
		-nomysql    	 : Remove RingMySQL from distribution
		-noodbc     	 : Remove RingODBC from distribution
		-nosqlite   	 : Remove RingSQLite from distribution
		-noopengl   	 : Remove RingOpenGL from distribution
		-nofreeglut 	 : Remove RingFreeGLUT from distribution
		-nolibzip   	 : Remove RingLibZip from distribution
		-noconsolecolors : Remove RingConsoleColors from distribution
		-nocruntime	 : Remove C Runtime from distribution
		-qt	    	 : Add RingQt to distribution
		-allegro 	 : Add RingAllegro to distribution
		-openssl  	 : Add RingOpenSSL to distribution
		-libcurl  	 : Add RingLibCurl to distribution
		-mysql    	 : Add RingMySQL to distribution
		-odbc     	 : Add RingODBC to distribution
		-sqlite   	 : Add RingSQLite to distribution
		-opengl   	 : Add RingOpenGL to distribution
		-freeglut 	 : Add RingFreeGLUT to distribution
		-libzip   	 : Add RingLibZip to distribution
		-consolecolors   : Add RingConsoleColors to distribution
		-cruntime	 : Add C Runtime to distribution
*/

C_WINDOWS_NOOUTPUTNOERROR = " >nul 2>nul"
C_LINUX_NOOUTPUTNOERROR   = " > /dev/null"

aLibsInfo = [
	[:name = :qt ,
	 :title = "RingQt",
	 :windowsfiles = [
		"Qt5*.dll",
		"ringqt.dll",
		"icudt54.dll",
		"icuin54.dll",
		"icuuc54.dll",
		"libEGL.dll",
		"libstdc++-6.dll",
		"libwinpthread-1.dll",
		"libGLESv2.dll",
		"D3Dcompiler_47.dll"
	 ] ,
	 :windowsfolders = [
		:audio,
		:bearer,
		:iconengines,
		:imageformats,
		:mediaservice,
		:platforms,
		:playlistformats,
		:position,
		:printsupport,
		:sensorgestures,
		:sqldrivers,
		:translations
	 ],
	 :linuxfiles = [
		"libringqt.so"
	 ]
	],
	[:name = :allegro ,
	 :title = "RingAllegro",
	 :windowsfiles = [
			"allegro*.dll",
			"ring_allegro.dll",
			"FLAC.dll",
			"freetype.dll",
			"jpeg62.dll",
			"libpng16.dll",
			"ogg.dll",
			"physfs.dll",
			"theoradec.dll",
			"vorbis.dll",
			"vorbisfile.dll",	
			"zlib.dll"
	 ],
	 :linuxfiles = [
		"libringallegro.so"
	 ] 
	],
	[:name = :openssl ,
	 :title = "RingOpenSSL",
	 :windowsfiles = [
			"ring_openssl.dll",
			"ssleay32.dll",
			"libeay32.dll"
	 ],
	 :linuxfiles = [
		"libring_openssl.so"
	 ] 
	],
	[:name = :libcurl ,
	 :title = "RingLibCurl",
	 :windowsfiles = [
			"ring_libcurl.dll",
			"ring_internet.dll",
			"libcurl.dll"
	 ],
	 :linuxfiles = [
		"libring_libcurl.so"
	 ]
	],
	[:name = :mysql ,
	 :title = "RingMySQL",
	 :windowsfiles = [
			"ring_mysql.dll",
			"libmysql.dll"
	 ],
	 :linuxfiles = [
		"libring_mysql.so"
	 ]
	],
	[:name = :odbc ,
	 :title = "RingODBC",
	 :windowsfiles = [
			"ring_odbc.dll"
	 ],
	 :linuxfiles = [
		"libring_odbc.so"
	 ] 
	],
	[:name = :sqlite ,
	 :title = "RingSQLite",
	 :windowsfiles = [
			"ring_sqlite.dll"
	 ],
	 :linuxfiles = [
		"libring_sqlite.so"
	 ] 
	],
	[:name = :opengl ,
	 :title = "RingOpenGL",
	 :windowsfiles = [
			"ring_opengl*.dll"
	 ],
	 :linuxfiles = [
		"libring_opengl21.so"
	 ] 
	],
	[:name = :freeglut ,
	 :title = "RingFreeGLUT",
	 :windowsfiles = [
			"ring_freeglut.dll",
			"freeglut.dll",
			"glew32.dll"
	 ],
	 :linuxfiles = [
		"libring_freeglut.so"
	 ] 
	],
	[:name = :libzip ,
	 :title = "RingLibZip",
	 :windowsfiles = [
			"ring_libzip.dll"
	 ],
	 :linuxfiles = [
		"libring_libzip.so"
	 ]
	],
	[:name = :consolecolors ,
	 :title = "RingConsoleColors",
	 :windowsfiles = [
			"ring_consolecolors.dll"
	 ],
	 :linuxfiles = [
		"libring_consolecolors.so"
	 ] 
	],
	[:name = :cruntime ,
	 :title = "C Runtime",
	 :windowsfiles = [
			"msvc*.dll",
			"libgcc_s_dw2-1.dll"
	 ] 
	]
]

func Main 
	aPara = sysargv
	aOptions = []
	# Get Options 
		for x = len(aPara) to 1 step -1
			if left(trim(aPara[x]),1) = "-"
				aOptions + lower(trim(aPara[x]))
				del(aPara,x)
			ok
		next
	nParaCount = len(aPara)
	if (nParaCount > 2) or ( nParaCount = 2 and aPara[1] != "ring" )
		cFile = aPara[nParaCount]
		msg("Process File : " + cFile)
		BuildApp(cFile,aOptions)
	else 
		drawline()
		see "Application : Ring2EXE (Ring script to Executable file)" + nl
		see "Author      : 2017, Mahmoud Fayed <msfclipper@yahoo.com>" + nl
		see "Usage       : ring2exe filename.ring [Options]" + nl
		drawline()
	ok

func DrawLine 
	see copy("=",70) + nl

func msg cMsg
	see "Ring2EXE: " + cMsg + nl

func BuildApp cFileName,aOptions
	msg("Start building the application...")
	# Generate the Object File 
		systemSilent(exefolder()+"../bin/ring " + cFileName + " -go -norun")
	# Generate the C Source Code File 
		cFile = substr(cFileName,".ring","")
		GenerateCFile(cFile,aOptions)
	# Generate the Batch File 
		cBatch = GenerateBatch(cFile,aOptions)
	# Build the Executable File 
		msg("Build the Executable File...")
		systemSilent(cBatch)
		msg("End of building script...")
	# Clear Temp Files 	
		if not find(aOptions,"-keep")
			cleartempfiles()
		ok
	# Prepare Application for distribution
		if find(aOptions,"-dist")
			Distribute(cFile,aOptions)
		ok
		msg("End of building process...")

func GenerateCFile cFileName,aOptions
	# Display Message
		msg("Generate C source code file...")
	nTime = clock()
	# Convert the Ring Object File to Hex.
		cFile = read(cFileName+".ringo")
		cHex  = str2hexCStyle(cFile)
	fp = fopen(cFileName+".c","w+")
	# Start writing the C source code - Main Function 
	if isWindows() and find(aOptions,"-gui")
		cCode = '#include "windows.h"' 	+ nl +
			'#include "stdio.h"' 	+ nl +
			'#include "stdlib.h"' 	+ nl +
			'#include "conio.h"' 	+ nl +  
			'#include "ring.h"' 	+ nl +  nl +
		'int WINAPI WinMain ( HINSTANCE hInstance, HINSTANCE hPrevInstance, LPSTR lpCmdLine, int nShowCmd )' + nl +  "{" + nl + nl +
		char(9) + 'int argc;' + nl + char(9) + 'char **argv ;' + nl + 
		char(9) + 'argc = __argc ; ' + nl + char(9) + 'argv = __argv ;' + nl + nl +
		char(9) + 'static const unsigned char bytecode[] = { 
			  '
	else
		cCode = '#include "ring.h"' + nl + nl +
		'int main( int argc, char *argv[])' + nl +  "{" + nl + nl +
		char(9) + 'static const unsigned char bytecode[] = { 
			  '
	ok
	fputs(fp,cCode)
	# Add the Object File Content		
		fputs(fp,cHex)
	fputs(fp, ", EOF" + char(9) + "};"+
	"

	RingState *pRingState ;
	pRingState = ring_state_new();	
	pRingState->argc = argc;
	pRingState->argv = argv;
	ring_state_runobjectstring(pRingState,(char *) bytecode);
	ring_state_delete(pRingState);

	return 0;" + nl + 
	"}")
	fclose(fp)	
	msg("Generation Time : " + ((clock()-nTime)/clockspersecond()) + " seconds...")

func GenerateBatch cFileName,aOptions
	msg("Generate batch|script file...")
	if find(aOptions,"-static")
		return GenerateBatchStatic(cFileName,aOptions)
	else 
		return GenerateBatchDynamic(cFileName,aOptions)
	ok

func GenerateBatchDynamic cFileName,aOptions
	msg("Generate batch|script file for dynamic building...")
	return GenerateBatchGeneral([
		:file = cFileName ,
		:ringlib = [
			:windows = "..\lib\ring.lib" ,
			:linux   = "-L $PWD/../lib -lring",
			:macosx	 = "$PWD/../lib/libring.dylib"
		]
	],aOptions)	

func GenerateBatchStatic cFileName,aOptions
	msg("Generate batch|script file for static building...")
	return GenerateBatchGeneral([
		:file = cFileName ,
		:ringlib = [
			:windows = "..\lib\ringstatic.lib" ,
			:linux   = "-L $PWD/../lib -lringstatic",
			:macosx	 = "-L $PWD/../lib -lringstatic"
		]
	],aOptions)


func GenerateBatchGeneral aPara,aOptions
	cFileName = aPara[:file]
	cFile = substr(cFileName," ","_")
	# Generate Windows Batch (Visual C/C++)
		cCode = "call "+exefolder()+"../src/locatevc.bat" + nl +
			"#{f3}" + nl +
			'cl #{f1}.c #{f2} #{f4} -I"..\include" -I"../src/" /link #{f5} /OUT:#{f1}.exe' 
		cCode = substr(cCode,"#{f1}",cFile)
		cCode = substr(cCode,"#{f2}",aPara[:ringlib][:windows])
		# Resource File 
			cResourceFile = cFile + ".rc"
			if fexists(cResourceFile)
				cCode = substr(cCode,"#{f3}","rc " + cResourceFile)
				cCode = substr(cCode,"#{f4}",cFile + ".res")
			else 
				cCode = substr(cCode,"#{f3}","")
				cCode = substr(cCode,"#{f4}","")
			ok
		# GUI Application 
			if find(aOptions,"-gui")
				cCode = substr(cCode,"#{f5}",'advapi32.lib shell32.lib /SUBSYSTEM:WINDOWS,"5.01" ')
			else 
				cCode = substr(cCode,"#{f5}",' /SUBSYSTEM:CONSOLE,"5.01" ')
			ok
		cWindowsBatch = cFile+"_buildvc.bat"
		write(cWindowsBatch,cCode)
	# Generate Linux Script (GNU C/C++)
		cCode = 'gcc -rdynamic #{f1}.c -o #{f1} #{f2} -lm -ldl  -I $PWD/../include  '
		cCode = substr(cCode,"#{f1}",cFile)
		cCode = substr(cCode,"#{f2}",aPara[:ringlib][:linux])
		cLinuxBatch = cFile+"_buildgcc.sh"
		write(cLinuxBatch,cCode)
	# Generate MacOS X Script (CLang C/C++)
		cCode = 'clang #{f1}.c #{f2} -o #{f1} -lm -ldl  -I $PWD/../include  '
		cCode = substr(cCode,"#{f1}",cFile)
		cCode = substr(cCode,"#{f2}",aPara[:ringlib][:macosx])
		cMacOSXBatch = cFile+"_buildclang.sh"
		write(cMacOSXBatch,cCode)
	# Return the script/batch file name
		if isWindows()	
			return cWindowsBatch
		but isLinux()
			systemSilent("chmod +x " + cLinuxBatch)
			return "./"+cLinuxBatch
		but isMacosx()
			systemSilent("chmod +x " + cMacOSXBatch)
			return "./"+cMacOSXBatch	
		ok

func ClearTempFiles
	msg("Clear Temp. Files...")
	if isWindows()
		systemSilent("cleartemp.bat")
	else
		systemSilent("./cleartemp.sh")
	ok

func SystemSilent cCmd
	if isWindows()
		system(cCmd + C_WINDOWS_NOOUTPUTNOERROR)
	else 
		system(cCmd + C_LINUX_NOOUTPUTNOERROR)
	ok

func Make_Folder cFolder
	SystemSilent("mkdir " + cFolder)

func CreateOpenFolder cFolder
	Make_Folder(cFolder)
	chdir(cFolder)

func Distribute cFileName,aOptions
	cBaseFolder = currentdir()
	CreateOpenFolder(:target)
	if isWindows()
		Distribute_For_Windows(cBaseFolder,cFileName,aOptions)
	but isLinux()
		Distribute_For_Linux(cBaseFolder,cFileName,aOptions)
	but isMacOSX()
		Distribute_For_MacOSX(cBaseFolder,cFileName,aOptions)
	ok

func Distribute_For_Windows cBaseFolder,cFileName,aOptions
	# Delete Files 
		WindowsDeleteFolder("windows")
	CreateOpenFolder(:windows)
	# copy the executable file 
		msg("Copy the executable file to target/windows")
		WindowsCopyFile(cBaseFolder+"\"+cFileName+".exe")
	# Check ring.dll
		if not find(aOptions,"-static")	
			msg("Copy ring.dll to target/windows")	
			WindowsCopyFile(exefolder()+"\ring.dll")
		ok
	# Check All Runtime 
		if find(aOptions,"-allruntime")	
			msg("Copy all libraries to target/windows")	
			for aLibrary in aLibsInfo 
				if not find(aOptions,"-no"+aLibrary[:name])
					if islist(aLibrary[:windowsfolders])
						for cLibFolder in aLibrary[:windowsfolders]
							WindowsCopyFolder(cLibFolder)
						next
					ok
					if islist(aLibrary[:windowsfiles])
						for cLibFile in aLibrary[:windowsfiles]
							WindowsCopyFile(exefolder()+"\"+cLibFile)
						next
					ok
				else 
					msg("Skip library "+aLibrary[:title])
				ok
			next  	
		else	# No -allruntime
			for aLibrary in aLibsInfo 
				if find(aOptions,"-"+aLibrary[:name])
					msg("Add "+aLibrary[:title]+" to target/windows")
					if islist(aLibrary[:windowsfolders])
						for cLibFolder in aLibrary[:windowsfolders]
							WindowsCopyFolder(cLibFolder)
						next
					ok
					if islist(aLibrary[:windowsfiles])
						for cLibFile in aLibrary[:windowsfiles]
							WindowsCopyFile(exefolder()+"\"+cLibFile)
						next
					ok
				ok
			next 				
		ok


func WindowsDeleteFolder cFolder
	systemSilent("rd /s /q " + cFolder)

func WindowsCopyFolder cFolder
	cParentFolder = currentdir()
	CreateOpenFolder(cFolder)
	systemsilent("copy " + exefolder()+cFolder)
	chdir(cParentFolder)

func WindowsDeleteFile cFile 
	systemSilent("del " + cFile)

func WindowsCopyFile cFile 
	systemSilent("copy " + cFile)

func Distribute_For_Linux cBaseFolder,cFileName,aOptions
	# Delete Files 
		LinuxDeleteFolder(:linux)
	CreateOpenFolder(:linux)
	cDir = currentdir()
	CreateOpenFolder(:bin)
	# copy the executable file 
		msg("Copy the executable file to target/linux/bin")
		LinuxCopyFile(cBaseFolder+"/"+cFileName)
	chdir(cDir)
	CreateOpenFolder(:lib)
	# Check ring.so
		if not find(aOptions,"-static")	
			msg("Copy ring.so to target/linux/lib")	
			LinuxCopyFile(exefolder()+"/../lib/libring.so")
		ok


func LinuxDeleteFolder cFolder
	systemSilent("rm -r " + cFolder)


func LinuxDeleteFile cFile 
	systemSilent("rm " + cFile)

func LinuxCopyFile cFile 
	systemSilent("cp " + cFile + " .")

func Distribute_For_MaxOSX cBaseFolder,cFileName,aOptions
	CreateOpenFolder(:macosx)
