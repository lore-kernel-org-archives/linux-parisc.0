Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from carbon.btinternet.com (carbon.btinternet.com [194.73.73.92])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1D7B3601A
	for <parisc-linux@lists.parisc-linux.org>; Wed,  5 Dec 2001 09:40:09 -0700 (MST)
Date: Wed, 5 Dec 2001 16:39:21 +0000
From: Colin Watson <cjwatson@debian.org>
To: Randolph Chung <tausq@debian.org>
Cc: Richard Hirst <rhirst@linuxcare.com>,
	debian-hppa@lists.debian.org, parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: groff build on hppa
Message-ID: <20011205163920.GA24484@riva.ucam.org>
References: <20011204134445.GA9231@riva.ucam.org> <20011205155919.E7051@linuxcare.com> <20011205081939.O944@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20011205081939.O944@tausq.org>
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

On Wed, Dec 05, 2001 at 08:19:39AM -0800, Randolph Chung wrote:
> > Builds for me with -O1 rather than -O2 in debian/rules, if that is
> > any help.
> 
> This is a known bug with the compiler... .building with
> -fno-strength-reduce works around this bug.

So would there be objections to me doing a special build on hppa with
the CFLAGS/CXXFLAGS hacked, given that there are three days left, or do
I have to upload again?

-- 
Colin Watson                                  [cjwatson@flatline.org.uk]
