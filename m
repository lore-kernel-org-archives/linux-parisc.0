From: James Bottomley <James.Bottomley@SteelEye.com>
Subject: Re: [parisc-linux] New libc6 2.3.5-6: poll timeouts
Date: Sun, 11 Sep 2005 11:47:44 -0500
Message-ID: <1126457264.4831.23.camel@mulgrave>
References: <200509111606.j8BG6X7U025669@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain
Cc: PARISC list <parisc-linux@lists.parisc-linux.org>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200509111606.j8BG6X7U025669@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sun, 2005-09-11 at 12:06 -0400, John David Anglin wrote:
> I updated my c3k yesterday afternoon.  This upgrade included libc6
> version 2.3.5-6.  I now find that many commands run as slow as molasses.
> For example,

libc6 from testing (and, actually unstable) doesn't currently work.  We
think it's the fact that it's compiled with gcc-4.0.

You have one of the minor symptoms ... try starting bind9 ...

Lamont is supposed to be arranging a binNMU of libc6 compiled with
gcc-3.3.5, but temporarily you can just force install libc6 from stable.

James


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
