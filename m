From: Randolph Chung <randolph@tausq.org>
Subject: Re: [parisc-linux] Improving performance of munmap
Date: Fri, 8 Oct 2004 10:05:47 -0700
Message-ID: <20041008170547.GJ14151@tausq.org>
References: <20041007230232.GF14151@tausq.org>
	<20041008020343.GN24430@baldric.uwo.ca>
	<20041008041657.GG14151@tausq.org>
	<20041008165926.GI14151@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Carlos O'Donell <carlos@baldric.uwo.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20041008165926.GI14151@tausq.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> On the a500 that i am testing on, this bumps the cache threshold up 
> from 0.5MB to 1MB after the timing.

sorry, that should read:
"On the a500 that i am testing on, this bumps the cache threshold up 
 from 0.5MB to 2MB after the timing."

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
