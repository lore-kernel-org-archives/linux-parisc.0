Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.speakeasy.net (mail12.speakeasy.net [216.254.0.212])
	by dsl2.external.hp.com (Postfix) with ESMTP id 52C184851
	for <parisc-linux@parisc-linux.org>; Wed, 17 Jul 2002 08:26:40 -0600 (MDT)
Date: Wed, 17 Jul 2002 07:29:15 -0700
From: Randolph Chung <randolph@tausq.org>
To: joel.soete@freebel.net
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] 2.4.19-rc1-ac6 Merge pa55: #error ...?
Message-ID: <20020717142915.GG641@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <1026832288.1687.57.camel@irongate.swansea.linux.org.uk> <1026913104.3d357350a4057@webmail.tiscalinet.be> <20020717144543.A13352@parcelfarce.linux.theplanet.co.uk> <1026914852.3d357a24c4a4a@webmail.tiscalinet.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1026914852.3d357a24c4a4a@webmail.tiscalinet.be>
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

> In mean time is somebody is interested by my merge 2.4.19-rc1 pa55?
> It is not perfect but it works on my b2000 (from pre5 pa14) so it should be good
> starting point? (about 500k compressed by bzip2)

As I understand it, here's the plan -- others pls feel free to comment:

- to get pa stuff to work will require a number of arch-indep changes;
  these are not likely to make it into 2.4.19
- ergo, the earliest pa will work with upstream kernels is in the 2.4.20
  series
- in order to avoid doing the merging work twice (once now to acX, and
  then again to 2.4.20) we are going to hold off on trying to merge the
  rest upstream until 2.4.20 is out.....

willy made a good point that as much as possible we don't want upstream
pa bits to be newer than what we have in cvs, otherwise merging 
will be much more difficult later on.

randolph
--  
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
