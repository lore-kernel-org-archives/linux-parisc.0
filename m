Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Sat, 20 Sep 2003 17:46:05 -0600
From: Grant Grundler <grundler@parisc-linux.org>
To: "SUDARSANAN,RANJITH (HP-India,ex2)" <ranjith_sudarsanan@hp.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Problems with raw interface.
Message-ID: <20030920234605.GB31268@dsl2.external.hp.com>
References: <A11077E28200D51182EA00D0B775525309A2AA44@xin02.india.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <A11077E28200D51182EA00D0B775525309A2AA44@xin02.india.hp.com>
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

On Fri, Sep 19, 2003 at 06:07:41PM +0530, SUDARSANAN,RANJITH (HP-India,ex2) wrote:
> >>>>What does "dd if=/dev/raw/raw2 of=/tmp/o_raw2 bs=512 count=8" result in?
> This command reads the first 4K bytes of the disk and writes it to file
> o_raw2. 

Ah yes, but is the data correct?
I'll assume not since your attempt with /dev/raw/raw1 also failed.

Basically something looks broken in parisc for raw devices.
I was clearly able to reproduce this failure.

grant
