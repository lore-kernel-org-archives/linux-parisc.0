Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.speakeasy.net (mail15.speakeasy.net [216.254.0.215])
	by dsl2.external.hp.com (Postfix) with ESMTP id EB6B14844
	for <parisc-linux@lists.parisc-linux.org>; Tue, 26 Aug 2003 23:00:57 -0600 (MDT)
Received: from unknown (HELO speakeasy.net) (caslivkoff@[216.27.161.152])
          (envelope-sender <caslivkoff@speakeasy.net>)
          by mail15.speakeasy.net (qmail-ldap-1.03) with SMTP
          for <parisc-linux@lists.parisc-linux.org>; 27 Aug 2003 05:00:56 -0000
Date: Wed, 27 Aug 2003 01:00:59 -0400
Subject: Re: [parisc-linux] x86 on b2000
Content-Type: text/plain; delsp=yes; charset=US-ASCII; format=flowed
Mime-Version: 1.0 (Apple Message framework v552)
Cc: parisc-linux@lists.parisc-linux.org
To: Grant Grundler <grundler@parisc-linux.org>
From: Chuck Slivkoff <caslivkoff@speakeasy.net>
In-Reply-To: <20030827034036.GA9928@dsl2.external.hp.com>
Message-Id: <72F3D1D0-D84B-11D7-8E2F-000393581E44@speakeasy.net>
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

On Tuesday, Aug 26, 2003, at 23:40 US/Eastern, Grant Grundler wrote:

> On Tue, Aug 26, 2003 at 09:30:23PM -0400, Chuck Slivkoff wrote:
>> The B2000 does have integrated graphics. It is an FX-e.
>
> "integrated" != "soldered on the motherboard"
> "built-in"   ~= "soldered on the motherboard"

I've always used these interchangably.

> ie The Gfx card can be removed and in fact must be remove if one wants
> to use the only 66mhz/64-bit PCI slot the B2000/C3000 has.
>
> AFAIK, the B2000/C3000/J5000 systems only have plug-in PCI gfx cards.
> At least all the ones I've seen are plug-in.

The B2000 is an exception. I participated in the Field Review of this  
box ("Kazoo", IIRC) & we have one of these in our lab in Roseville.  
This box was considered a "cheap" alternative to a C3000 with a smaller  
power supply, fewer PCI slots, fewer DIMM slots and integrated (see  
below) graphics. The FX-e is soldered on the motherboard.

 From pg 23 of the B2000 the Owner's Guide:

   Monitor Connector
   The B2000 workstation has an integrated HP VISUALIZE fxe graphics
   chip on the system board. Thus, the monitor connector on the rear  
panel
   of the workstation connects your monitor to this graphics chip on the
   system board.

http://h20000.www2.hp.com/bizsupport/ 
CoreRedirect.jsp?targetPage=http%3A%2F%2Fh200007.www2.hp.com%2Fbc%2Fdocs 
%2Fsupport%2FSupportManual%2Flpv37670%2Flpv37670.pdf
