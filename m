Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from luonnotar.infodrom.org (luonnotar.infodrom.org [195.124.48.78])
	by dsl2.external.hp.com (Postfix) with ESMTP id F38C44829
	for <parisc-linux@lists.parisc-linux.org>; Wed, 18 Sep 2002 13:57:26 -0600 (MDT)
Date: Wed, 18 Sep 2002 21:48:22 +0200
From: Martin Schulze <joey@infodrom.org>
To: Stephan Trajkoff <stephan@itp.bg>
Cc: parisc-linux@lists.parisc-linux.org
Message-ID: <20020918194822.GR30868@finlandia.infodrom.north.de>
References: <20020918193205.597D04829@dsl2.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
In-Reply-To: <20020918193205.597D04829@dsl2.external.hp.com>
Subject: [parisc-linux] Re: anybody has succefully compiled Mysql-3.23.49 from debian source
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

Stephan Trajkoff wrote:
> 
> -------------------------------------------------------------------
> -->> FREE Perl CGI scripts add WEB ACCESS to your POP email accounts!
> -->> Download today!! http://www.adjeweb.com
> -------------------------------------------------------------------
> 
> Hi, I tried to compile mysql-3.23.49, but no good result, there are 
> many errors in compiling with libraries. I do dist-upgrade every week

Why don't you use the package provided by Debian?

libmysqlclient10-dev  stable    3.23.49-8   hppa

libmysqlclient10      stable    3.23.49-8   hppa

mysql-client          stable    3.23.49-8   hppa

mysql-server          stable    3.23.49-8   hppa

i.e. use apt-get install ...

Regards,

	Joey

-- 
Whenever you meet yourself you're in a time loop or in front of a mirror.
