From: nobody@nowhere.invalid (Unknown)
Subject: (unknown)
Date: Sat, 22 Nov 2014 01:38:05 +0000 (UTC)
Message-ID: <48180.3620853045$1416620285@news.gmane.org>

    # safe-cvsimport assumes changes in newly-imported versions should *never*
    # be visible on the main trunk until explicitly placed there, usually by
    # a merge (cvs update -jx -jy).

Maybe someday I'll re-name it 'isolated-cvsimport'.  FYI in some cases
it's not handling upstream-removed files correctly.  No idea why this
changed or when I'll get interested enough to fix it.  For now I'll be
happy to consult and/or fix problems which result from safe-cvsimport.

	-P
