From: Matt Taggart <taggart@carmen.fc.hp.com>
Subject: [parisc-linux] Re: How to update firmware on c180 using a cd rom
Date: Thu, 18 Jul 2002 20:59:18 -0600
Message-ID: <20020719025918.724FF37E97__35098.2709941038$1416621545$gmane$org@carmen.fc.hp.com>
References: <3CFE411D@utnt02.utmem.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: "debian-hppa@lists.debian.org" <debian-hppa@lists.debian.org>,
	parisc-linux@parisc-linux.org
To: Thaddeus A Wilson <TAWILSON@UTMEM.EDU>
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
In-Reply-To: Message from Thaddeus A Wilson <TAWILSON@UTMEM.EDU>
   of "Thu, 18 Jul 2002 22:04:32 CDT." <3CFE411D@utnt02.utmem.edu>
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

Thaddeus A Wilson writes...

> i have a c180 with the hrc-24 graphics card and would like to install parisc 
> linux on it.  i am having some troubles and thought that an update in the 
> firmware from 4.3 to 6.2 might help matters.  i am interested in converting 
> the lifimage to cd and booting from it.
>  
> maybe i could unpack the lifimage to a directory and use mkisofs and cdrecord
> to make a bootable cd from iso image?

Just burn it directly to a cd with cdrecord, no need for mkisofs.

Your other options are,
 - netboot it using bootp/dhcp and tftp
 - dd it to a scsi device like a hard-drive or dat tape, and boot that

-- 
Matt Taggart
taggart@fc.hp.com
