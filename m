Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.zigoo.net (e146.dhcp212-198-142.noos.fr [212.198.142.146])
	by dsl2.external.hp.com (Postfix) with ESMTP id 57C0D4829
	for <parisc-linux@lists.parisc-linux.org>; Fri,  3 Jan 2003 06:15:39 -0700 (MST)
Date: Fri, 3 Jan 2003 14:15:16 +0100
From: Thibaut VARENE <varenet@parisc-linux.org>
To: parisc-linux@lists.parisc-linux.org
Cc: csuder@cisco.com
Subject: Re: [parisc-linux] New year, new try : Mozilla & friends...
Message-Id: <20030103141516.61bb51c4.varenet@parisc-linux.org>
In-Reply-To: <20030102230705.0cdd05d6.csuder@cisco.com>
References: <20030102230705.0cdd05d6.csuder@cisco.com>
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

On Thu, 2 Jan 2003 23:07:05 -0800
"Christian Suder" <csuder@cisco.com> wrote:
> 
> Mozilla/skipstone/galeon are part of the distribution (even in 'stable')
> for a while now, but crash straightaway with page faults. 
> 
> Has anybody ever looked into where the problems here are ? There is a
> couple of other applications that have issues too, that may or may not be

Well, it's an old "feature" of hppa platform ;)

IIRC, all these problems are compiler-related stuff. Maybe with the new toolchain we will get rid of them...

/me pokes at toolchain-gurus for advice :^)


Thibaut VARENE
The PA/Linux ESIEE Team
http://pateam.esiee.fr/
