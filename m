From: Randolph Chung <randolph@tausq.org>
Subject: Re: More questions [Was: [parisc-linux] 2.6.10-rc1-pa11 profile data]
Date: Fri, 3 Dec 2004 07:41:59 -0800
Message-ID: <20041203154159.GB6359@tausq.org>
References: <418A80AE0000A9A8@mail-4-bnl.tiscali.it>
	<41B03ED8.8090505@tiscali.be>
Reply-To: Randolph Chung <randolph@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Joel Soete <soete.joel@tiscali.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <41B03ED8.8090505@tiscali.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> I test it on my b2k with 64bit kernel and it works but it didn't seems to 
> bring me any benefit?
> As far as I can believe readprofile: the ratio between the first and last 
> column is always the same (1/80 in this case).
> What did I miss?

what workload did you test this on? possibly you only see a benefit with
workloads that need to do a lot of page clearings.... so you probably
want to find a workload so that the first column is >>1

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
