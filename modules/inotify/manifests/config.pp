class inotify::config{	
	file{"/usr/lib/nagios/plugins/check_filechange.py":
			ensure=>present,
			source=>"puppet:///modules/inotify/check_filechange.py",
			mode=>0755,
			owner=>"root",
			group=>"root",
			require=>Class["inotify::install"]
	}
}

