Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mgw-x1.nokia.com (mgw-x1.nokia.com [131.228.20.21])
	by dsl2.external.hp.com (Postfix) with ESMTP id D8E4B487D
	for <parisc-linux@lists.parisc-linux.org>; Fri, 17 Jan 2003 02:20:51 -0700 (MST)
Received: from esvir01nok.ntc.nokia.com (esvir01nokt.ntc.nokia.com [172.21.143.33])
	by mgw-x1.nokia.com (Switch-2.2.1/Switch-2.2.0) with ESMTP id h0H9Jr005346
	for <parisc-linux@lists.parisc-linux.org>; Fri, 17 Jan 2003 11:19:53 +0200 (EET)
Date: Fri, 17 Jan 2003 11:20:38 +0200
From: Nahkola Mikko <mnahkola@trinms01.ntc.nokia.com>
To: ext Grant Grundler <grundler@dsl2.external.hp.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Interesting network card ...
Message-ID: <20030117092038.GK17760@aurinko.ntc.nokia.com>
References: <20030115085619.GA17760@aurinko.ntc.nokia.com> <20030116021111.GD8543@dsl2.external.hp.com> <20030116093028.GD17760@aurinko.ntc.nokia.com> <20030117065427.GA11137@dsl2.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
In-Reply-To: <20030117065427.GA11137@dsl2.external.hp.com>
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

On Thu, Jan 16, 2003 at 11:54:27PM -0700, ext Grant Grundler wrote:
> On Thu, Jan 16, 2003 at 11:30:28AM +0200, Nahkola Mikko wrote:

> > > ...a newer kernel would be more interesting.
> > Recommendations? Any ready-built package that I should try,

> Ideally, our CVS kernels: 32-2.4.20-pa21.tar.gz
> autobuilt 32-bit kernels are on ftp.parisc-linux.org/kernels/32/ 
> I can't say if they work "just fine" on C240 or not though
> since I don't test that.

Installed 32-2.4.20-pa20 as the -21 only had the Config, no vmlinux or 
System.map there. 

> > > This does sound like a bug (fixed) in the tulip driver relating to
> > > MII initialization. But I'm surprised to see it manifest on a C240.
> > What do you mean, surprised to see it manifest on a C240? How so?

> The original problem seemed to be a CPU timing problem where the PHY reset
> was not recovering faster than the CPU could pound down the next accesses

> The fix is to follow the 802.x spec which describes the MII register
> set and how to properly do a MII reset (involves some polling).
> Details should be in the parisc-linux mail archive or lkml.

Well, at any rate, it doesn't complain about tulip0/eth0 anymore ... but 
it still doesn't pass any traffic or obey mii-tool. 
"10 Mbit, half duplex, autonegotiation complete, remote fault, link ok" 
... even after "mii-tool -F 100baseTx-HD eth0".

Looks better now anyway ;-/

> > BTW, the NIO 100BT is an interesting beast. It (or the driver) is the 
> > only reason why one of our HP-UX boxes only gets about half an year max 
> > uptime usually ... and has other "interesting" "features". 

> If you have extras of those, I know someone who wants one.

No extras, sorry. They're in real use. (don't tell me that's a bad choice 
- well, if you know of something else to get a H to do 100BT ...)

> > Notably it is a higher revision than the builtin adapter, and therefore I 
> > wouldn't expect to need the de4x5 driver.
> I don't either. I thought we had the tulip cards working just fine.

Well, the builtin adapter isn't doing "just fine" either, but that may be 
firmware-related - when set to 100-HD with mii-tool it goes to 100-FD or 
some such that the hub (yes) doesn't like at all. I suppose I should get 
around to updating the box's firmware. 
 
Oh well, it autonegotiates to 10HD and that works. The other end is a HP 
J3294A (ProCurve 10/100 hub) that obivously can't do anything FD ... and 
yes, I did use other stuff to test the 6911 too. 



And additionally, there's some (non-network-related?) stuff in dmesg that 
I don't remember seeing before, "HP SDC: Transaction add failed: 
transaction already queued?" Is that the HIL stub or something? Should I 
pursue that too?


-- 
Mikko Nahkola   <mikko.nahkola@nokia.com>
Tre-IN sysadmin <mnahkola@trein.ntc.nokia.com>
