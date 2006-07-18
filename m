From: Randolph Chung <randolph@tausq.org>
Subject: [parisc-linux] Re: A warning about NPTL pthreaddefs.h
Date: Tue, 18 Jul 2006 08:19:12 +0800
Message-ID: <44BC2900.4030303@tausq.org>
References: <119aab440607171537p25d0350he9aa937c439c428a@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1;
  format=flowed
Cc: parisc-linux <parisc-linux@lists.parisc-linux.org>
To: Carlos O'Donell <carlos@systemhalted.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <119aab440607171537p25d0350he9aa937c439c428a@mail.gmail.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> A warning that the pthreaddefs.h might be horribly wrong. I remember a
> long while ago adding padding the structures so they matched the size
> of the linuxthread types (atleast the lock position).
> 
> This padding is not correct, we would need to pull into our tree the
> static mutex initializers so they are correctly sized aswell.

fwiw,i don't think we need to worry about making the structs the same as 
linuxthreads (if that is even possible...), after all you cannot run a 
linuxthreads binary against nptl libs or vice versa...

randolph
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
