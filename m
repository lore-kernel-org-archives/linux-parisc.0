From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] J5000 LCD patch
Date: Wed, 23 Mar 2005 22:01:36 -0700
Message-ID: <20050324050136.GE10544@colo.lackof.org>
References: <200503231855.10502.dmp@davidmpye.dyndns.org>
	<20050323201831.GC10544@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: David Pye <dmp@davidmpye.dyndns.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050323201831.GC10544@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Wed, Mar 23, 2005 at 01:18:31PM -0700, Grant Grundler wrote:
> You want (lcd_info.min_cmd_delay * 1000000)/HZ

Of course this is wrong...David was almost right in his original
and got it right in a followup:
	(lcd_info.min_cmd_delay * HZ)/1000000

ie (us * Hz)/us == Hz and that's what we want.

sorry,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
