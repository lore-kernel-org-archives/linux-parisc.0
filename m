From: Randolph Chung <tausq@debian.org>
Subject: [parisc-linux] Re: atlas3 on hppa: unexpected reloc type
Date: Sun, 13 Jun 2004 15:33:58 -0700
Message-ID: <20040613223358.GJ19250@tausq.org>
References: <20040613162317.E51E44F24E@enterprise.cs.utk.edu>
Reply-To: Randolph Chung <tausq@debian.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: R Clint Whaley <rwhaley@cs.utk.edu>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20040613162317.E51E44F24E@enterprise.cs.utk.edu>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

(cc'ed to the list)

> Thanks for the pointers.  From the document, I was able to add prefetch support
> for PA-RISC 2.0 to ATLAS's header file. 

Cool! Be aware that, if atlas relies on being able to prefetch invalid
addresses and have that not fault, then it will only work on some PA 
processors (mostly pa20) and not all of them.

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
