Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from sj-msg-core-1.cisco.com (sj-msg-core-1.cisco.com [171.71.163.11])
	by dsl2.external.hp.com (Postfix) with ESMTP id 84F4F482A
	for <parisc-linux@parisc-linux.org>; Thu,  3 Jan 2002 20:30:47 -0700 (MST)
Date: Thu, 3 Jan 2002 19:30:36 -0800
From: Christian Suder <csuder@cisco.com>
To: "Tom" <palinux@alaskatech.org>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Reset default console?
Message-Id: <20020103193036.772a6d0b.csuder@cisco.com>
In-Reply-To: <Pine.LNX.4.33.0201031746180.19160-100000@goliath.alaskatech.org>
References: <Pine.LNX.4.33.0201031746180.19160-100000@goliath.alaskatech.org>
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


Tom,


on the (older) C110 you hit <TAB> as soon as the monitor shows some sign
of life and it will cycle through the available settings. I guess it's the
same on a C180.

Otherwise you can remove the adapter to force it back to the serial
console. 

	Christian 



On Thu, 3 Jan 2002 17:56:21 -0900 (AKST)
"Tom" <palinux@alaskatech.org> wrote:

> Okay, I finally got my EVC-VGA adapter from HP (who are actually the
> cheapest place to get one!) and plugged in the A1097C monitor so I can
> start using a local keyboard/mouse/monitor on the C180. I changed the
> console in the PDC from serial_1 to graphics(0), checked that
graphics(0)> is the local video adapter and said it's settings were
1280x1024@75hz,> then rebooted. After I got a completely scrambled screen,
I remembered> that the A1097C is 1280x1024@72...
> 
> Unfortunately, since graphics(0) is valid, I no longer get PDC info on
the> serial cable. Does anyone know how I can reset this, or force it to
go> back to the serial console?
> 
> I also found one source online that said the A1097C monitor is
> 1280x960@75, rather than 1280x1024. Anyone at HP care to confirm or deny
> this? :-)
> 
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
