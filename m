From: "Michael S. Zick" <mszick@morethan.org>
Subject: Re: [parisc-linux] w-a to what [Was: D380 and ext[23] fs grave pb]
Date: Mon, 11 Sep 2006 08:29:22 -0500
Message-ID: <200609110829.23168.mszick@morethan.org>
References: <45018CEC.4040104@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <45018CEC.4040104@scarlet.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Fri September 8 2006 10:31, Joel Soete wrote:
> Hello James, Matthrew,
>=20
> I come back to you with this pb because as explained in a previous mail:=
=20
> <http://lists.parisc-linux.org/pipermail/parisc-linux/2006-September/0301=
52.html>
>=20
> , it seems to be related to ncr53c720 driver.
>=20

That's the second hit on that driver this week:
http://lists.parisc-linux.org/pipermail/parisc-linux/2006-August/030054.html

In the above mail, the driver was reporting:

ncr53c720-0: rev 0xf irq 66
ncr53c720-0: ID 7, Fast-10, Parity Checking, Differential
scsi0 : ncr53c8xx-3.4.3g

=A0 =A0Vendor: SEAGATE =A0 Model: ST15150W =A0 =A0 =A0 =A0 =A0Rev: HP07
=A0 =A0Type: =A0 Direct-Access =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0A=
NSI SCSI revision: 02

Where the model number was single-ended, not: ST15150WD (Differential)
and the problem was that the drive could not be written.

Joel, what does that part of your dmesg have to say?
Do the messages match what you have installed?

Dave pointed out that some drives firmware does not report
the correct model number - making this a non-problem.

Mike
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
