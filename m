From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [parisc-linux] Machine hanging during high-traffic NFS
Date: Thu, 21 Jul 2005 12:04:13 -0400
Message-ID: <20050721160413.GA1482@roadwarrior.mcmartin.ca>
References: <42DD6A7F.8090706@excelcia.org>
	<20050720010425.GC24060@roadwarrior.mcmartin.ca>
	<42DDF65E.7010605@excelcia.org>
	<20050720164058.GA3681@colo.lackof.org>
	<42DF51D4.3010106@excelcia.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Kurt Fitzner <kfitzner@excelcia.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <42DF51D4.3010106@excelcia.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Thu, Jul 21, 2005 at 01:42:12AM -0600, Kurt Fitzner wrote:
> I 'downgraded' to 2.6.8.1-pa11 as Mr. Anglin suggested and I am not able
> to reproduce the hang.  Would it be helpful if I were to identify the
> exact kernel version where the hang first begins to occur?
> 

Binary searching from 2.6.8.1-pa11 onwards would be helpful.

[Pick the middle version between 2.6.8.1 and current, if it's broken, at
 the middle of 2.6.8.1-pa11 to middle, otherwise middle to current, and
 continue until you can narrow the timeframe.]

Cheers,
-- 
Kyle McMartin
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
