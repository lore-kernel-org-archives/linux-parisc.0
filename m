Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Tom <palinux@alaskatech.org>
Cc: PA-RISC Linux List <parisc-linux@parisc-linux.org>
Subject: Re: [parisc-linux] Tape boot errors and NFS-Root-Howto? 
In-Reply-To: Message from Tom <palinux@alaskatech.org>
   of "Sun, 30 Dec 2001 09:14:42 -0900." <Pine.LNX.4.33.0112300907380.11391-100000@goliath.alaskatech.org>
References: <Pine.LNX.4.33.0112300907380.11391-100000@goliath.alaskatech.org> 
Date: Mon, 31 Dec 2001 10:35:57 -0700
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20011231173557.C96664832@dsl2.external.hp.com>
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

Tom wrote:
> So I'm trying to update the firmware on my C180.
...
> Decide to pull up the NFS-Root-Howto at Grant's suggestion, just boot the
> patch file off the network. Unfortunately, p.e.h.c appears to be down :-(

Correct URL for the (old) NFS Root HOWTO is:
	http://lists.parisc-linux.org/hypermail/parisc-linux/0616.html

I'll update the FAQ shortly.

> Questions: Does anyone know if I'm doing the tape creation right?

Yes. I believe you are.

> I did
> 'unshar PF_CC2X0061' (to get the .frm and .text files), then 'dd
> if=CC2X0061.frm of=/dev/st1 bs=2k' (which writes 790 records without
> error).

> The unshar says the .frm is compressed data - is this something
> that needs further unpacking before writing, perhaps?

Don't trust unshar?
grundler <516>file c200/CC2X0062.frm
c200/CC2X0062.frm: lif file

I've placed several .frm files on ftp.parisc-linux.org/kernels/
Seems like you can use the one I've placed in c200 directory.

| Patch Description: HP 9000 Models C160/C180/C200/C240 revision 6.2 firmware

> Also, does anyone
> have a local copy of the NFS-Root-Howto that they can point me to? The
> only ones I can find are ~1999 and quite out of date...

Did I just hear you volunteer to rewrite mkp's posting? ;^)
I'll get it linked to the FAQ if you do...

thanks,
grant
