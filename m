Return-Path: <carlos@baldric.uwo.ca>
Received: from fep01-mail.bloor.is.net.cable.rogers.com
	(fep01-mail.bloor.is.net.cable.rogers.com [66.185.86.71])
	by dsl2.external.hp.com (Postfix) with ESMTP id 708E348C6
	for <parisc-linux@lists.parisc-linux.org>;
	Wed, 28 Jan 2004 16:10:45 -0700 (MST)
Date: Wed, 28 Jan 2004 18:11:06 -0500
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: Joel Soete <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] RE: [parisc-linux-cvs] linux-2.6 carlos
Message-ID: <20040128231106.GC19840@baldric.uwo.ca>
References: <20040128060516.492DE4941AA@palinux.hppa>
	<400CB8A1000067CB@ocpmta3.freegates.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <400CB8A1000067CB@ocpmta3.freegates.net>
Cc: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Wed, Jan 28, 2004 at 03:00:48PM +0100, Joel Soete wrote:
> Hi all,
> 
> This boot fine on the b180 (32bit kernel), the b2k (32bit kernel only even
> with CONFIG_PA20 is Ok but failed with 64bit kernel?) and N4000-55 (same
> 64bit kernel  build with my own kgcc-3.3.3 :)).
> 
> Any way this last test set aside any pb with _my_ gcc compiler :).

Undo the patch, rebuild, and see if it still fails?
Could you explain more about the failure?

c.
