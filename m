Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id E54E1485B
	for <parisc-linux@lists.parisc-linux.org>; Sun, 14 Jul 2002 20:46:33 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 17Tvse-0003MO-00
	for parisc-linux@lists.parisc-linux.org; Mon, 15 Jul 2002 03:46:32 +0100
Date: Mon, 15 Jul 2002 03:46:32 +0100
From: Matthew Wilcox <willy@debian.org>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] O_DIRECT on devices
Message-ID: <20020715034632.E27706@parcelfarce.linux.theplanet.co.uk>
References: <20020711082259.GF822@tykepenguin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20020711082259.GF822@tykepenguin.com>; from patrick@tykepenguin.com on Thu, Jul 11, 2002 at 09:22:59AM +0100
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

On Thu, Jul 11, 2002 at 09:22:59AM +0100, Patrick Caulfield wrote:
> This works fine on Alpha & Intel but seems very unreliable on parisc for some
> reason. Sometimes it works, sometimes it oopses "do_page_fault() pid=2120
> command='lvm' type=15 address=0x00000001" and sometimes I just get back the
> wrong information (at least LVM thinks its wrong I haven't check in detail just
> what is up with it).

pid 2120 did a NULL pointer dereference ... you should be able to trace
it with the IAOQ, perhaps.  I'm not sure whether anyone's really played
with the O_DIRECT code yet, it could well be buggy on PA.  What you're
seeing sounds like bogus cache behaviour.

-- 
Revolutions do not require corporate support.
