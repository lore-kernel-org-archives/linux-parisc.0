Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from sj-msg-core-1.cisco.com (sj-msg-core-1.cisco.com [171.71.163.11])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4933E485B
	for <parisc-linux@lists.parisc-linux.org>; Fri, 15 Feb 2002 00:13:17 -0700 (MST)
Date: Thu, 14 Feb 2002 23:13:12 -0800
From: Christian Suder <csuder@cisco.com>
To: "James S" <smith-james@home.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Power LED
Message-Id: <20020214231312.37ca1c9e.csuder@cisco.com>
In-Reply-To: <002101c1b5ee$b5f8a620$02c1a8c0@james.co.uk>
References: <002101c1b5ee$b5f8a620$02c1a8c0@james.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Fri, 15 Feb 2002 02:02:19 -0500
"James S" <smith-james@home.com> wrote:

> >> what causes the power led to go out on the 712 systems ?
> >> is it software controlled ?
> >
> >I don't think so.
> >The power button is under software control but I think
> >the LED is wired to the power supply directly.
> >
> >grant
> 
> was just wondering - mine goes out after the system starts loading -
> flashes before that
> 
> when it had hp-ux on it, it stayed on
> 
> another question...
> 
> is it possible to hook the power button to the shutdown command like it
> is in hp-ux ?

The LED and the powerswitch work as expected on my 712/80 at least since
the 0.9.3 ISO timeframe. I remember the LED was not working at some point
in the past, though,

	Christian 





> 
> Thanks
> 
> James S
> 
> 
> 
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
