Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id CAA28346
	for <parisc-linux@puffin.external.hp.com>; Wed, 23 Aug 2000 02:49:43 -0600
Message-Id: <200008230849.KAA01294@pallas.spacetec.no>
From: tor@spacetec.no (Tor Arntsen)
Date: Wed, 23 Aug 2000 10:49:31 +0200
In-Reply-To: Alan Modra <alan@linuxcare.com.au>
       "Re: Incompatibility of PIC and non-PIC" (Aug 20,  5:21)
To: parisc-linux@thepuffingroup.com
Subject: Re: Incompatibility of PIC and non-PIC
Cc: parisc@lists.linuxcare.com
List-ID: <linux-parisc.vger.kernel.org>

On Aug 20,  5:21, Alan Modra wrote:
>On Sat, 19 Aug 2000, Matthew Wilcox wrote:
>
>> btw, is there any option to cvs diff which produces files which can be
>> applied by any known version of patch?  in my experience, patch can't
>> find files specified by Index: lines _unless_ both the +++ and the ---
>> files can't be found -- which is rarely the case with common names such
>> as Makefile or ChangeLog.
>
>I haven't found one, and it's a real pain.  I tend to edit patches
>covering multiple directories before passing them to patch.
>
>"sed -e '/^[+-][+-]/d' < cvs_diff_file | patch -p0 --posix" ought to work.
>
>Alan

Which versions of CVS are you using?  CVS used to output diffs without
including the directory path in the --- and +++ lines, but that's been
fixed long ago.  I don't have any problems with patch anymore.

-Tor
