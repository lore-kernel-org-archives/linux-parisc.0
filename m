Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id KAA05675
	for <parisc-linux@puffin.external.hp.com>; Fri, 7 Jan 2000 10:31:26 -0700
Received: by wallace.ece.rice.edu
	via sendmail from stdin
	id <m126dHI-000LEOC@wallace.ece.rice.edu> (Debian Smail3.2.0.102)
	for parisc-linux@thepuffingroup.com; Fri, 7 Jan 2000 11:34:20 -0600 (CST)
Date: Fri, 7 Jan 2000 11:34:20 -0600
From: "Ross J. Reedstrom" <reedstrm@wallace.ece.rice.edu>
To: Mark Wild <M_Wild@tunstall.co.uk>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Thanks...alot
Message-ID: <20000107113420.C9918@rice.edu>
References: <51C39E66FF96D11194FCAA0004000304933A96@tele02.localnet> <200001071552.JAA01881@egsner.cirr.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200001071552.JAA01881@egsner.cirr.com>; from eric@cirr.com on Fri, Jan 07, 2000 at 09:52:30AM -0600
List-ID: <linux-parisc.vger.kernel.org>

On Fri, Jan 07, 2000 at 09:52:30AM -0600, Eric Schnoebelen wrote:
> 
> Mark Wild writes:
> - From: eric@cirr.com [mailto:eric@cirr.com]
> - > 	You might check to see what interpreter is called out at
> - > the top of /etc/rc.  If it's still /bin/sh, go verify what
> - > /bin/sh points to..
> - 
> - How can I do that? I'm not familiar with all the options/commands
> - of the hpux command from the ISL prompt.
> 
> 	I was suggesting you do that from a multi-user login
> (assuming you've got one.. perhaps a rash assumption..)

Mark, you seem  to be in the same situation I was, witha similarly
decommissioned 730 (academic leftover): no root, no account at all! It
booted to a X/OpenVue login screen just fine, however. (Had to take it
down hard with the toc switch, after that.)

Not knowing any of the HP-UX specific tricks, I fell back on a maxim
from computer security: 'There is no computer security without physical
security.'

I yanked the boot HD, dropped it onto the SCSI chain of my linux box,
used grep on the 'raw' block device as so:

grep -ba 'root:[^:]\{13\}:'

to find all occurences of something that looked like a root passwd entry,
with crypt()ed password, and fired up lde (Linux Disk Editor) to change
it to the hash for a password I knew. Worked great!  Strangely enough,
I found 6 copies, with three different passwords.

Once logged in as root, I used the standard utilities to change passwords
again, just in case there was something I missed.

Ross

P.S. 
Later, I aquired the Y2K 9.X->10.20 upgrade kit, with the core 10.20
CD. You just need to call the HP fulfillment desk, and give them the
part number from the web site. I order it on 12/7, they shipped 12/14,
FEDEX, so charge. I even recieved and invoice for part B6815AA, cost 0.00
Unfortunately, it's not bootable on a 730. Oh, the webpage that mentions
all this:

http://www.hp.com/visualize/programs/y2k/y2k_menu/y2k_upgr/oskit.html

It give an 800 number for calling from the U.S. You'll have to trackdown
HP UK number to call, I'm afraid.

-- 
Ross J. Reedstrom, Ph.D., <reedstrm@rice.edu> 
NSBRI Research Scientist/Programmer
Computer and Information Technology Institute
Rice University, 6100 S. Main St.,  Houston, TX 77005
