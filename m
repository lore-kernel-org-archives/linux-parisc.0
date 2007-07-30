From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Re: Boot problem with HPPA 735/125 w/ A1439A CRX
Date: Sun, 29 Jul 2007 20:12:50 -0400 (EDT)
Message-ID: <200707300012.l6U0Co1e006326__35326.6855156564$1416624424$gmane$org@hiauly1.hia.nrc.ca>
References: <200707292101.l6TL13M2002430@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: deller@gmx.de,
 parisc-linux@lists.parisc-linux.org
To: dave@hiauly1.hia.nrc.ca (John David Anglin)
Return-Path: <dave@hiauly1.hia.nrc.ca>
In-Reply-To: <200707292101.l6TL13M2002430@hiauly1.hia.nrc.ca> from "John David Anglin" at Jul 29, 2007 05:01:02 pm
List-ID: <linux-parisc.vger.kernel.org>

> > So it crashes in userspace ony (and not the kernel). Any backtraces ?
> 
> Nothing.  It seems X just exits.  Hmmm, maybe I should set
> NoTrapSignals and DisableVidModeExtension.

Didn't help.  I can get rid of the mode failure by commenting out the
Modes line in the Display subsection.  However, this doesn't fix the
problem.  The last lines in the Xorg log are:

...
(II) XINPUT: Adding extended input device "Configured Mouse" (type: MOUSE)
(II) XINPUT: Adding extended input device "Generic Keyboard" (type: KEYBOARD)
(II) Configured Mouse: ps2EnableDataReporting: succeeded
FreeFontPath: FPE "/usr/share/fonts/X11/misc" refcount is 2, should be 1; fixing.

There are no EEs or WWs in the log file.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
