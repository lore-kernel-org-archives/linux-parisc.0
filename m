Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by sod.res.cmu.edu (8.8.7/8.8.7) with SMTP id AAA05858
	for <hppa-linux@sod.res.cmu.edu>; Sat, 13 Mar 1999 00:21:19 -0500
Date: Fri, 12 Mar 1999 21:21:36 -0800 (PST)
From: Kumar <kumar@ix.netcom.com>
To: hppa-linux@thepuffingroup.com
cc: jason@equator.com, kumar@ix.netcom.com
Subject: Re: [hppa-linux] Boot #4 and source on ftp site
In-Reply-To: <199903112235.QAA05851@equator.com>
Message-ID: <Pine.LNX.3.96.990312211042.208B-100000@quark.ix.netcom.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

	
	I  compiled without libmilli.a and it did compile.
	File ipl_s.s says 
	The object code is converted to LIF (logical interchange format)
	and then at the beginning of the boot media.

	So how do I convert the binary "ipl" to LIF. I tried "lifinit"
	and "mkboot" combination. But no luck, I keep getting 
	
	"Bad IPL size" and "Error reading IPL" error messages. 

	I tried "dd" also on the raw disk. No luck with that either.

	So my question is how to place built "ipl" binary at the
	appropriate place on the disk so that PDC finds it. Any magic
	combination of commands ? Looks like I am missing something
	obvious.


Thanks in advance,

-pkd

On Thu, 11 Mar 1999, Jason Eckhardt wrote:

> 
> Boot test #4: This is essentially the same code as #3 but I have taken
> out some delays, modified the cache flush routines, and turned
> verbose (debug) mode back on. I want to make sure that not having the delays
> makes no difference and that no characters get dropped when there is a lot
> of text (as in debug mode). Please let me know if the test still passes
> as before. Hopefully this will be the last test for a while. Kernel work
> comes next.
> 
> I have uploaded the binary as well as a new source drop to the ftp site. The
> source is now GPL'd and a detailed README is included which gives an overview
> of the boot code operation. This source supersedes any previous source you
> may have laying around.
> 
> ftp from sod.res.cmu.edu:/pub/parisc/hilo
>   boot_rel_0.2.tar.gz        The latest source code and documentation.
>   bootstrap_4.bin.gz         Bootstrap binary #4. 
> 
> Regards, 
> Jason Eckhardt.
> 
> -------------------------------------------------------------------------
> To unsubscribe: send e-mail to hppa-linux-request@thepuffingroup.com with
> `unsubscribe' as the subject.
> 
> 
> 
