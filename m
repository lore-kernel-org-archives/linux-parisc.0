Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from sj-msg-core-2.cisco.com (sj-msg-core-2.cisco.com [171.69.24.11])
	by dsl2.external.hp.com (Postfix) with ESMTP id ED74F482A
	for <parisc-linux@lists.parisc-linux.org>; Mon, 21 Jan 2002 18:25:25 -0700 (MST)
Message-Id: <4.3.2.7.2.20020121170358.045b37c0@mira-sjc5-9.cisco.com>
Date: Mon, 21 Jan 2002 17:12:30 -0800
To: raffo@neuronet.pitt.edu, parisc-linux@lists.parisc-linux.org
From: Christian Suder <csuder@cisco.com>
Subject: Re: [parisc-linux] Appropriate entries for apt sources.list
In-Reply-To: <3C4B7CC8.1000300@neuronet.pitt.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
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


Good question... I personally changed it from "testing" to "unstable" as I 
had some trouble with X after upgrading the kernel. The new X server that 
fixed it was only available in unstable (at least back then). However there 
are examples where using "unstable" can break things (e.g. the recent gpm 
trouble). Previous ISOs used "unstable" by default, IIRC.

I think a fair answer is, if the system as it running now stable and you 
are not missing anything, stick with the "testing". If you want to run the 
latest and greatest kernel, or whatever application, you might want to go 
to "unstable".

I just edit the source.list and run update,

         Christian


At 09:28 PM 1/20/2002 -0500, Rafael Herrera wrote:
>I just finished a test install of CD 0.9.3 on a B132L workstation. 
>Comparing this with a couple of 715/75, 715/80 installs I made before, I 
>noticed a difference in the sources.list files.
>
>My last installation contains:
>
>deb ftp://ftp.us.debian.org/debian/ testing main non-free contrib
>deb-src ftp://ftp.us.debian.org/debian/ testing main non-free contrib
>deb http://non-us.debian.org/debian-non-US testing/non-US main contrib 
>non-free
>deb-src http://non-us.debian.org/debian-non-US testing/non-US main contrib 
>non-free
>
>Whereas the old installs have:
>
>deb ftp://ftp.us.debian.org/debian/ unstable main non-free contrib
>deb-src ftp://ftp.us.debian.org/debian/ unstable main non-free contrib
>deb http://non-us.debian.org/debian-non-US unstable/non-US main contrib 
>non-free
>deb-src http://non-us.debian.org/debian-non-US unstable/non-US main 
>contrib non-free
>
>What would be the most appropriate setting at this point (in order to get 
>the most usability in the system)? If "testing" is preferable, how can one 
>revert the packages from "stable" to "testing" version using apt-get commands?
>
>Thanks.
>
>--
>      Rafael
>
>
>_______________________________________________
>parisc-linux mailing list
>parisc-linux@lists.parisc-linux.org
>http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
