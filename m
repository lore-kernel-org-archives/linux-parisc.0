Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Mon, 3 Feb 2003 09:53:21 -0700
To: "Aaron St. Pierre" <asp@ungod.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] kernel compile
Message-ID: <20030203165321.GA17807@dsl2.external.hp.com>
References: <20030203020247.GB1046@hadron> <20030203041122.GB29454@dsl2.external.hp.com> <20030203053336.GC1046@hadron> <20030203060359.GF29454@dsl2.external.hp.com> <20030203064328.GD1046@hadron>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030203064328.GD1046@hadron>
From: grundler@dsl2.external.hp.com (Grant Grundler)
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

On Mon, Feb 03, 2003 at 01:43:28AM -0500, Aaron St. Pierre wrote:
> Anyway I got the the TOC information for both processors after
> I tried to boot my kernel. It is
> all on that page ( http://hadron.dyndns.org/parisc/ ) 

IIA Offset                   = 0x00000000f0080570

that's not a kernel address. Looks like a PDC call died. :^(

> I also added a link to the firmware. I am running 2.0 of the firmware
> and according to hp the most recent is 2.1 or : 
> 
> Patch Name: /firmware_patches/hp/cpu/PF_CJ224021
> Description: HP 9000 Model J2240 firmware 2.1 patch
> Date       : 00/10/06

hmm...I'd stick with 2.0 for now.

> I will start popping stuff out of the kernel, although I am sure I took
> out all of the stuff wrt graphics. Another try for persistance sake wont
> hurt :) 

You still have STI drivers enabled and CONFIG_FB enabled.
I'd start with those and then remove others one-by-one.

> As far as the palo message, i only started noticing it when I went to
> v1.2 of palo. One thing I should note, when I set up / i made it ext3,
> boot is off of / and not its own fs so when i realized what i did I just
> changed fstab accordingly so it would mount as ext2, although that
> couldn't be the problem either since it is loading the debian kernels.

/ can be ext3. Palo doesn't care since ext2/ext3 are compatible.
What's important is /boot/vmlinux is < 2GB on disk.

grant
