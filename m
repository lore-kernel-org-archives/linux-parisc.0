From: Grant Grundler <grundler@parisc-linux.org>
Subject: [parisc-linux] Re: [patch 1/1] delete unused file
Date: Sun, 26 Dec 2004 23:33:13 -0700
Message-ID: <20041227063313.GH29492@colo.lackof.org>
References: <20041225175939.7DEF71ED41@trashy.coderock.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@parisc-linux.org,
 matthew@wil.cx
To: domen@coderock.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20041225175939.7DEF71ED41@trashy.coderock.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sat, Dec 25, 2004 at 06:59:49PM +0100, domen@coderock.org wrote:
> 
> Remove nowhere referenced file. (egrep "filename\." didn't find anything)
> 
> Signed-off-by: Domen Puncer <domen@coderock.org>

Thanks - I will delete it from cvs.parisc-linux.org repository once
a "sanity check build" completes. I also couldn't find any references.
palo (parisc boot loader) doesn't use this file either.

thanks again,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
