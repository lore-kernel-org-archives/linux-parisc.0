From: Randolph Chung <randolph@tausq.org>
Subject: [parisc-linux] Re: pa_memcpy: 2 small question
Date: Tue, 11 Jan 2005 17:49:11 -0800
Message-ID: <20050112014911.GW18497@tausq.org>
References: <20050110085446.GS18497@tausq.org>
	<41DE61B80000150A@mail-8-bnl.mail.tiscali.sys>
Reply-To: Randolph Chung <randolph@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Joel Soete <soete.joel@tiscali.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <41DE61B80000150A@mail-8-bnl.mail.tiscali.sys>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> why don't you save the usage of OPSIZ (defined sizeof(unsigned long int))
> and use shrpd, ldd, std when ifdef __LP64__ ? (certainly another stuff I
> missed sorry )

that can be done as well, but cpy_dstaligned is supposed to be a
slow-path for the copy routine, and doing __LP64__ stuff means i can't
easily test it in userspace, so i didn't bother. you are certainly
welcome to try.

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
