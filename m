Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from thinkpad.home (pc4-hems4-0-cust39.bre.cable.ntl.com [213.105.90.39])
	by dsl2.external.hp.com (Postfix) with ESMTP id 97ECF482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 30 May 2002 02:24:49 -0600 (MDT)
Date: Thu, 30 May 2002 09:01:49 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: marc <marc@centraltx.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Java and SSH
Message-ID: <20020530080149.GR3471@sleepie.demon.co.uk>
References: <200205300023.AA908198370@mail.centraltx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200205300023.AA908198370@mail.centraltx.com>
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

On Thu, May 30, 2002 at 12:23:49AM -0500, marc  wrote:
> I got ssh up and running. Also, why does it bomb when I uncomment the line in my sources.list that has to do with the security updates?? I have network
> connectivity now, and heres what I get for the
> java possibilities:
> 
> seki:/etc/apt# more sources.list
> 
> deb cdrom:[Debian GNU/Linux 3.0 prerelease _Woody_ - Unofficial hppa Binary-1 (2
> 0011205)]/ unstable contrib main
> deb http://non-us.debian.org/debian-non-US unstable non-US/main non-US/contrib n
> on-US/non-free
> deb http://http.us.debian.org/debian/ unstable main non-free contrib
> deb-src http://http.us.debian.org/debian/ unstable main non-free contrib
> # deb http://security.debian.org/ unstable updates/main updates/contrib updates/
> non-free

Security updates only exist for stable releases, and don't exist for
woody yet as it isn't quite released.    Someone correct me if that's
not quite accurate.

Richard
