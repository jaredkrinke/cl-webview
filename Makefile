libwebview.so: webview/webview.h webview.cc
	c++ webview.cc -shared -fPIC `pkg-config --cflags --libs gtk+-3.0 webkit2gtk-4.1` -o libwebview.so

clean:
	rm -f libwebview.so

