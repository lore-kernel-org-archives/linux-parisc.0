From: Randolph Chung <tausq@debian.org>
Subject: Re: [parisc-linux] mmap and GCC precompiled headers
Date: Thu, 15 Jul 2004 14:43:32 -0700
Message-ID: <20040715214331.GD546@tausq.org>
References: <20040715203946.GN32326@parcelfarce.linux.theplanet.co.uk>
	<200407152134.i6FLY3GU021049@hiauly1.hia.nrc.ca>
Reply-To: Randolph Chung <tausq@debian.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200407152134.i6FLY3GU021049@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> Obviously, this isn't a problem on lots of other ports or everybody
> would be screaming.

The reason for this is that the PA has strict aliasing requirements 
for virtual memory aliases, so we have to jump through hoops to make 
sure we don't create incorrectly aliased mappings. I'm afriad there's
not much that we can do about this.

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
