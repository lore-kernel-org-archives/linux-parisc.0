Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.goquest.com (ns1.goquest.com [12.18.108.6])
	by dsl2.external.hp.com (Postfix) with SMTP id 983954829
	for <parisc-linux@lists.parisc-linux.org>; Mon, 16 Jun 2003 06:07:54 -0600 (MDT)
Content-Type: text/plain;
  charset="iso-8859-1"
From: Michael S.Zick <mszick@goquest.com>
To: Eric Huiban <grompf@grompf.net>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Serial port problem.
Date: Mon, 16 Jun 2003 06:58:33 -0500
References: <E19RXnb-0000LH-00@tyrann>
In-Reply-To: <E19RXnb-0000LH-00@tyrann>
MIME-Version: 1.0
Message-Id: <03061606583300.00942@wolf686>
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

On Sunday 15 June 2003 08:43 am, Eric Huiban wrote:
> Hi all,
>
> I just need to install an 'old' modem (USR Sportster V34) on a freshly
> installed HP 9000/730. Using minicom i only managed to communicate
> with the modem up to 19200bps. I'm using ttyS0 as backup console port and
> ttyS1 as modem port.
>
> here is the content of my serial.conf generated during the debian
> installation :
>
> ###PORT STATE GENERATED USING AUTOSAVE-ONCE###
> ###AUTOSAVE-ONCE###
> ###AUTOSAVE###
> #
> [snip : comments]
> /dev/ttyS0 uart 16550A port 0x0000 irq 90 baud_base 454545 spd_vhi
> /dev/ttyS1 uart 16550A port 0x0000 irq 89 baud_base 454545 spd_vhi
>
> Is there something specific to the HP 9000 computers , or just a little
> something i missed somewhere ?
>
Such as a UART speed limit?
Depends on the model, but on some older machines, 19200 is all you get.
Subject has come up on the mailing list before; info should be in the
ML archives.

Mike
>
> Thant you all !
>
> Eric Huiban, aka Grompf.
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
