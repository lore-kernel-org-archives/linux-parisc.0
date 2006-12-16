From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] killing a set of user processes causes system
	reboot
Date: Sat, 16 Dec 2006 12:36:04 -0500 (EST)
Message-ID: <200612161736.kBGHa4sZ021645__11576.3675109067$1416624233$gmane$org@hiauly1.hia.nrc.ca>
References: <119aab440612140929i3f5ea59dvb002b6fa525978ff@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: carlos@systemhalted.org (Carlos O'Donell)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <119aab440612140929i3f5ea59dvb002b6fa525978ff@mail.gmail.com>
	from "Carlos O'Donell" at Dec 14, 2006 12:29:26 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> FYI I've been running gcc builds on my c3k to reproduce this, but I
> haven't seen anything like this.

A little more info.

I'm seeing this almost every time with GCC 4.2.0 branch using
vmlinux-2.6.18-rc7-pa1 or vmlinux-2.6.19-g211c7899-dirty.  The
kernels are 32-bit with the default c3000 config.  It's happened
in the last two builds and checks running the libjava testsuite.
The tests timeout, so I would think the dejagnu/tcl framework
would have tried to kill them when the timeout occured.

Within a group of processes that are stuck, I can kill all but one
without causing a system reboot.  The processes appear stuck in the
kernel.  I don't see any activity with strace.

I often see this with the Process_3.java test.  For example,
http://gcc.gnu.org/ml/gcc-testresults/2006-12/msg00637.html

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)

// Create a process and pipe data through it.  waitFor() the process
// in a different thread than the one that created it.
import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintStream;


public class Process_3 implements Runnable
{
  Process p;

  public void run()
  {
    try
      {
	Runtime r = Runtime.getRuntime();
	String[] a = { "sed", "-e", "s/Hello/Goodbye/" };
	synchronized (this)
	  {
	    p = r.exec(a);
	    this.notifyAll();
	  }
	OutputStream os = p.getOutputStream();
	PrintStream ps = new PrintStream(os);
	ps.println("Hello World");
	ps.close();
      }
    catch (Exception ex)
      {
	System.out.println(ex.toString());
        System.exit(1);
      }
  }

  public static void main(String[] args)
  {
    try
      {
	Process_3 p3 = new Process_3();
	Thread t = new Thread(p3);
	t.start();
	synchronized (p3)
	  {
	    while (p3.p == null)
	      p3.wait();
	  }

	InputStream is = p3.p.getInputStream();
	InputStreamReader isr = new InputStreamReader(is);
	BufferedReader br = new BufferedReader(isr);
	String result = br.readLine();
	if (! "Goodbye World".equals(result))
	  {
	    System.out.println("bad 1");
	    return;
	  }
	result = br.readLine();
	if (result != null)
	  {
	    System.out.println("bad 2");
	    return;
	  }
	int c = p3.p.waitFor();
	System.out.println(c == 0 ? "ok" : "bad 3");
      }
    catch (Exception ex)
      {
	System.out.println(ex.toString());
      }
  }
}
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
