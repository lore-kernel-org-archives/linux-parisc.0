From: James Bottomley <James.Bottomley@SteelEye.com>
Subject: Re: [parisc-linux] Debugging 64-bit kernel crashes involving
Date: Fri, 23 Feb 2007 18:45:20 -0600
Message-ID: <1172277920.3424.83.camel__29496.7016009197$1416624311$gmane$org@mulgrave.il.steeleye.com>
References: <200702240039.l1O0dCxG017471@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain
Cc: parisc-linux@lists.parisc-linux.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200702240039.l1O0dCxG017471@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Fri, 2007-02-23 at 19:39 -0500, John David Anglin wrote:
> Just wondering why a protection id trap causes the system to eat
> sparcs...

Because we're in the kernel ... that's what the die_if_kernel() does.

> Is this a combined TLB issue?

It's clearly an Access ID mismatch ... but why I don't know; it's either
the TLB access ID or %cr8, which is what I asked Carlos to debug.

James


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
