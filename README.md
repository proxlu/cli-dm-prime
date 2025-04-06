# cli-dm-optimus
Solução de troca de vídeo e login automático para laptops optimus.

# Caso use essa solução no xfce4, no qual ela já ta configurada, cole o conteúdo abaixo no seu arquivo .bashrc:
```
# cliwm tty2
if [ "$DISPLAY" = ":1" ]; then
	xdotool getwindowfocus&>/dev/null||numlockx
	xdotool getwindowfocus&>/dev/null||xfwm4&>/dev/null&sleep 0.5
fi
```
