From: Max Grabert <parisc@gmail.com>
Subject: Re: [parisc-linux] 2.6.12-rc3-pa3 usb keyboard and mouse don't respond
Date: Mon, 9 May 2005 16:18:35 +0100
Message-ID: <e6eae0290505090818fe14a54@mail.gmail.com>
References: <200505081623.j48GNoF4003723@hiauly1.hia.nrc.ca>
Reply-To: Max Grabert <parisc@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1
To: John David Anglin <dave@hiauly1.hia.nrc.ca>,
 Linux/PA <parisc-linux@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200505081623.j48GNoF4003723@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On 5/8/05, John David Anglin <dave@hiauly1.hia.nrc.ca> wrote:
> I tried 2.6.12-rc3-pa3 yesterday but the console keyboard and mouse
> (usb) didn't respond after X came up.  I couldn't see any difference
> in the log files between this version and 2.6.11-pa4.  2.6.11-pa4
> boots ok.  Is this a known problem?

I also discovered that about a week ago, but failed to post a report on=20
the m-l (just mentioned it on IRC). On my c3700 the USB keyboard=20
actually seems to work somewhat (using 2.6.12-rc3-rc2), eg. if I switch=20
to the fbcon; however I can't enter anything in X/xdm, because the text
field is not selected and the USB mouse is not working.

I haven't tried any 64bit kernels lately, so I can't tell whether there
is an issue aswell ...

BTW, 2.6.11-pa4 is also working fine here.


Greetings,
   Max
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
