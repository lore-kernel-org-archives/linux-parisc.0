Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id CAA01798
	for <parisc-linux@puffin.external.hp.com>; Mon, 12 Jul 1999 02:51:16 -0600
Message-ID: <3789ACA8.20302CBA@ruhr-uni-bochum.de>
Date: Mon, 12 Jul 1999 10:51:52 +0200
From: Helge Deller <Helge.Deller@ruhr-uni-bochum.de>
MIME-Version: 1.0
To: parisc-linux <parisc-linux@thepuffingroup.com>
Subject: [Fwd: Re: [parisc-linux] PDC woes]
Content-Type: multipart/mixed;
 boundary="------------447487C03A72049BA408CDB6"
List-ID: <linux-parisc.vger.kernel.org>

Dies ist eine mehrteilige Nachricht im MIME-Format.
--------------447487C03A72049BA408CDB6
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit

If this message goes through, does anybody have any ideas, why my mails
sent from Netscape/Win95 goes through to the list, but those from
Netscape/Linux not ????
Thanks,
Helge.
(This message was sent with Netscape/Win95, the message below with
Netscape/Linux).


-------- Original Message --------
Betreff: Re: [parisc-linux] PDC woes
Datum: Mon, 12 Jul 1999 01:08:45 +0200
Von: Helge Deller <Helge.Deller@ruhr-uni-bochum.de>
An: Matthew Wilcox <Matthew.Wilcox@genedata.com>
CC: parisc-linux@thepuffingroup.com
Referenzen: <19990711011852.A25925@mencheca.ch.genedata.com>

Matthew Wilcox wrote:

> Philipp asked me to write a function to calculate the frequency of the
> interval timer.  However, the PDC doesn't want to cooperate.  I see
> `hello' printed on the screen, but not `world'.  So somehow this PDC
> call is going wrong.  Anyone have any clues?  pim_info is not very
> revealing.  If it helps anyone, the blinkenlights on my 715/33 are at:
>
> 10110010
>
> Is there a document somewhere describing what the blinkenlights mean?

>
>
> Here's the function:
>
> /*
>  * Find the interval timer frequency.
>  */
> static long calculate_interval_timer_frequency(void)
> {
>         long exponent, mantissa, result;
>         long buf[4] __attribute__ ((aligned (8)));
> printk("hello\n");
>         (*pdc) (PDC_TOD, PDC_TOD_ITIMER, buf, 0);
> printk("world\n");
>         exponent = (buf[0] >> 20) & 0x7ff;
>         mantissa = (buf[0] & 0xfffff) | 0x100000;
>         result = (mantissa >> (1038 - exponent)) * 625 * 625;
> printk("exponent = %ld mantissa = %ld result = %ld\n", exponent, mantissa, resul
> t);
>         return result;
> }
>
> --
> Matthew Wilcox <willy@bofh.ai>
> "Windows and MacOS are products, contrived by engineers in the service of
> specific companies. Unix, by contrast, is not so much a product as it is a
> painstakingly compiled oral history of the hacker subculture." - N Stephenson

Hi Matthew !

I took a little look at your code and found the problem(s):
1. When you call PDC-functions and want them to report values back into
a
result-buffer, this result-buffer always has to be a minimum of 32 longs
in size
and aligned (alignment differs from double-word bondaries to
4096-byte-boundaries
!).
The Problem was, that you only reserved a buffer for 4 longs, and so the
pdc-function overwrote the calling-stack, ergo: the pdc-call never
returned!
2. Maybe you also have to change (you should try!)
        (*pdc) (PDC_TOD, PDC_TOD_ITIMER, buf, 0);
to
        (*pdc) (PDC_TOD, PDC_TOD_ITIMER, &buf, 0);    (the &-sign..)

The new code looks then like the attachment.... and it worked here (But
I don´t
know, if the values are correct!).

my output here was: exponent = 1029, mantissa = 1048576 result =
800000000

I hope that I could help you,

Helge.
--------------447487C03A72049BA408CDB6
Content-Type: text/plain; charset=us-ascii;
 name="timer_calc.c"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="timer_calc.c"

/*
 * Find the interval timer frequency.
 */
static long calculate_interval_timer_frequency(void)
{
        long exponent, mantissa, result;
        long buf[32] __attribute__ ((aligned (8)));
	//changed to 32
printk("hello\n");
        (*pdc) (PDC_TOD, PDC_TOD_ITIMER, &buf, 0);
	//changed to &buf
printk("world\n");
        exponent = (buf[0] >> 20) & 0x7ff;
        mantissa = (buf[0] & 0xfffff) | 0x100000;
        result = (mantissa >> (1038 - exponent)) * 625 * 625;
printk("exponent = %d mantissa = %d result = %d\n", 
		exponent, mantissa, result);
        return result;
}


--------------447487C03A72049BA408CDB6--
