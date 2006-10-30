From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: [parisc-linux] 64-bit Userland
Date: Mon, 30 Oct 2006 10:43:25 -0500
Message-ID: <119aab440610300743y2eae2a5fje17535527eb17860@mail.gmail.com>
References: <A95DDDB4-BE43-42F9-BC91-4D0438118952@gmail.com>
	<119aab440610291758pcc33aaelb679d1c42bed62ef@mail.gmail.com>
	<62A625B5-C6B7-4266-ABA5-9F178D00EAEB@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1;
  format=flowed
To: "Alan Mock" <alan.mock@gmail.com>,
 parisc-linux <parisc-linux@lists.parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <62A625B5-C6B7-4266-ABA5-9F178D00EAEB@gmail.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On 10/29/06, Alan Mock <alan.mock@gmail.com> wrote:
> I would like to work on it, but I don't think I know enough to get
> started on my own.  I wouldn't mind working on the 32-bit port,
> either.  Is there a list somewhere of things that need work?

A great place to start is with our compiler. I would start by learning
to build and test GCC on your parisc-linux system.

http://gcc.gnu.org

You can use SVN to checkout the latest "trunk" of GCC, then run

configure --enable-languages=c,c++
make bootstrap
make -k check

Post the results of the testsuite to the list.

Cheers,
Carlos.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
