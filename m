Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from kcmso1.proxy.att.com (kcmso1.att.com [192.128.133.69])
	by dsl2.external.hp.com (Postfix) with ESMTP id D541E482B
	for <parisc-linux@lists.parisc-linux.org>; Fri,  2 Nov 2001 15:28:54 -0700 (MST)
Received: from attrh3i.attrh.att.com ([135.71.62.12])
	by kcmso1.proxy.att.com (AT&T IPNS/MSO-3.0) with ESMTP id fA2MSmY01306
	for <parisc-linux@lists.parisc-linux.org>; Fri, 2 Nov 2001 17:28:52 -0500 (EST)
Message-ID: <5360C45FAB301541AEB3C6A45A6B6A02706844@ocst09.ugd.att.com>
From: "Griffin, Aubrey, BMCIO" <aubreygriffin@att.com>
To: "'Richard Hirst'" <rhirst@linuxcare.com>,
	Herb Radford <herbr@magma.ca>
Cc: parisc-linux@lists.parisc-linux.org
Subject: RE: [parisc-linux] Irritating console message in 0.9.2 iso
Date: Fri, 2 Nov 2001 17:27:25 -0500 
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
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

I wiil add that this is a effective fix although quick and dirty. 

But first, you must stop the message by shutting down the dhcp client. 

Running "/etc/init.d/dhcp-client stop" as root will stop the messages from
displaying on the console immediately. 

Then, you can remove the dhcp-client startup scripts if you like.

An alternative solution to this problem is to change line 17 in
/etc/init.d/dhcp-client from "grep -q" to "grep -v -q" to prevent the dhcp
client from starting when the machine is rebooted.

Aubrey

-----Original Message-----
From: Richard Hirst [mailto:rhirst@linuxcare.com]
Sent: Friday, November 02, 2001 1:19 PM
To: Herb Radford
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Irritating console message in 0.9.2 iso


On Fri, Nov 02, 2001 at 12:33:42PM -0500, Herb Radford wrote:
> I have installed 0.9.2 on my two 712's (a /60 & a /80) with no problems
> (except learning about Debian).
> I am however bothered by a message which is displayed on the console at
> irregular (I think) intervals - sort of in bursts, then stops for a bit.
> The message makes it impossible to use dselect to proceed with the rest of
> the installation - the menu items in dselect get overwritten and it's not
> possible to determine what I have selected etc.
> 
> The message is:
> ip_local_deliver: bad loopback skb: PRE_ROUTING LOCAL_IN
> skb: pf=2(unowned) dev=lo len=328
> PROTO=17 0.0.0.0:68 255.255.255.255:67 L=328 S=0x10 I=0 F-0x0000 T=16
> 
> Now that is not cut and paste but the words are correct.
> 
> Hope someone has an answer!

Just added

> dhcp-client is started from init scripts, when it should only be invoked
> via ifup and ifdown.  The result is that any manual network
> configuration may be overwritten, and you may see messages like
> "ip_local_deliver: bad loopback skb..." on the console.  Fix with
> "rm /etc/rc?.d/*dhcp-client".

to the errata, which I believe will solve your problem.

Richard


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
