Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mta-1.gci.net (mta-1.gci.net [208.138.130.82])
	by dsl2.external.hp.com (Postfix) with ESMTP id 32796482A
	for <parisc-linux@parisc-linux.org>; Fri,  4 Jan 2002 00:40:08 -0700 (MST)
Received: from mmp-2.gci.net ([208.138.130.81]) by mta-1.gci.net
          (Netscape Messaging Server 4.15) with ESMTP id GPELAU00.DZ8 for
          <parisc-linux@parisc-linux.org>; Thu, 3 Jan 2002 22:40:06 -0900
Date: Thu, 3 Jan 2002 22:36:40 -0900 (AKST)
From: Tom <palinux@alaskatech.org>
To: Christian Suder <csuder@cisco.com>
Cc: <parisc-linux@parisc-linux.org>
Subject: Re: [parisc-linux] Reset default console?
In-Reply-To: <20020103193036.772a6d0b.csuder@cisco.com>
Message-ID: <Pine.LNX.4.33.0201031847270.19160-100000@goliath.alaskatech.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

On Thu, 3 Jan 2002, Christian Suder wrote:
> on the (older) C110 you hit <TAB> as soon as the monitor shows some sign
> of life and it will cycle through the available settings. I guess it's the
> same on a C180.

Let the record show that hitting [TAB] on the C180 as soon as the monitor
scrambles will cycle repeatedly through all 15 monitor settings; the
A1097C likes #12, at 1280x1024@75...

> Otherwise you can remove the adapter to force it back to the serial
> console.

This would have been my first thought, except for the whole "integrated
video" thing the C180 does :-)
