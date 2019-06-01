class inotify::install{
	package { "inotify-tools":
		ensure=>present,
	}
}
