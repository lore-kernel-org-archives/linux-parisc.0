Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.gmx.net (mail.gmx.net [213.165.64.20])
	by dsl2.external.hp.com (Postfix) with SMTP id 6BA09483A
	for <parisc-linux@lists.parisc-linux.org>; Sun,  6 Jan 2002 11:20:28 -0700 (MST)
Content-Type: text/plain;
  charset="iso-8859-1"
From: Helge Deller <deller@gmx.de>
To: Sven Cronenberg <sven.cronenberg@web.de>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] PALinux on HP9000/735-125
Date: Sun, 6 Jan 2002 19:18:29 +0100
References: <3C388C82.6070509@web.de>
In-Reply-To: <3C388C82.6070509@web.de>
MIME-Version: 1.0
Message-Id: <200201061918.29886.deller@gmx.de>
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

Hi Sven,

On Sunday 06 January 2002 18:42, Sven Cronenberg wrote:
> I installed PALinux 0.93 on my HP9000/735 running hat 125Mhz. I use
> a SCSI Disk connected to the narrow SCSI canel and the CRX48z
> graphics system.
>
> Im using kernel version 2.14.16-pa24 and updated the debian packages like
> mentioned in the 0.9.3. errata section today.
>
> Some questions:
> - I tried execessing the framebufferdevice. 'fbset' report '/dev/fb0: no
> such device'
>   though the STI console works fine as a text-console. Whats the reasion
> for that error?
>   Can I currently use the framebuffer device on the HP9000/735?

Try a newer kernel. It might work starting with kernel 2.4.17-pa2 and above.

> - has someone been able to make the 100mbit EISA-ethernet-card 3c597 work
>   in the HP9000/735 under Linux?

Sorry, no idea.

> - can I enable a german keymap for the HIL keyboard (trying to do this
> during the
>   installation made the keyboard totaly unusable so I had to reboot )?

You might want to write a script with setkeycodes.
Search the archives, I think I once sent such a script.

> - is the HIL mouse still unsupported or is there a patch or so to make
> it work?

Still unsupported.

Helge
