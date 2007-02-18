From: "Jeff Bailey" <jbailey@raspberryginger.com>
Subject: Re: [parisc-linux] One of these things is not like the other!
Date: Sun, 18 Feb 2007 13:25:26 -0500
Message-ID: <5b2e36650702181025t595bfdbam3d11b455be1cc657__33451.932288199$1416624299$gmane$org@mail.gmail.com>
References: <119aab440702181014p1b99a00dj191bab9884d42a8d@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=UTF-8;
  format=flowed
Cc: Kyle McMartin <kyle@mcmartin.ca>,
 parisc-linux <parisc-linux@lists.parisc-linux.org>
To: "Carlos O'Donell" <carlos@systemhalted.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <119aab440702181014p1b99a00dj191bab9884d42a8d@mail.gmail.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On 18/02/07, Carlos O'Donell <carlos@systemhalted.org> wrote:
> apt works fine from the chroot, but packages that rely on threads are broken.
> Packages relying on pthread_push_cleanup, and pthread_pop_cleanup are
> also broken since we have bugs in those functions according to the
> testsuite.

apt only stopped working for me after I recompiled libstdc++6, but
before I recompiled apt.

-- 
Jeff Bailey - http://www.raspberryginger.com/jbailey/
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
