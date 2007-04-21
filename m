From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Re: hanging linuxthread processes
Date: Sat, 21 Apr 2007 13:26:58 -0400 (EDT)
Message-ID: <200704211726.l3LHQxEg027021__516.683740034018$1416624339$gmane$org@hiauly1.hia.nrc.ca>
References: <1177174852.3718.73.camel@mulgrave.il.steeleye.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: kyle@mcmartin.ca,
 parisc-linux@lists.parisc-linux.org
To: James.Bottomley@SteelEye.com (James Bottomley)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <1177174852.3718.73.camel@mulgrave.il.steeleye.com> from "James
	Bottomley" at Apr 21, 2007 12:00:52 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> On Sat, 2007-04-21 at 12:16 -0400, Carlos O'Donell wrote:
> > Are you considering your patch for Kyle's CFP?
> 
> Er, what patch?

http://lists.parisc-linux.org/pipermail/parisc-linux/2007-February/031385.html

There's also the somewhat related space register issue associated with
TLB flushing:

http://lists.parisc-linux.org/pipermail/parisc-linux/2007-February/031365.html

Randolph's change to tlbflush.h is broken and needs to be reverted
if we don't have a better fix yet.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
