From: Carlos O'Donell <carlos@baldric.uwo.ca>
Subject: [parisc-linux] Testers required please (test-lws, test-probe)! :)
Date: Fri, 13 Aug 2004 00:30:36 -0400
Message-ID: <20040813043036.GA31035@baldric.uwo.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org


list,

What happens when you run these tests, as non-root, on your box?

http://cvs.parisc-linux.org/userspace/test-lws
http://cvs.parisc-linux.org/userspace/test-probe

Check out the above tests, make should build the test then just run the
single resulting executable and send back the results.

You run the tests at your own risk, they shouldn't damage your box, but
please tell me what they do on your box, including the output of dmesg 
(e.g. dmesg -c; <Run test>; dmesg >& email.txt; ) after running the
test.

Cheers,
Carlos.

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
