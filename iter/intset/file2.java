package intset;

import java.util.Iterator;
import java.util.Arrays;

public class file2
{
	public static void main(String[] args)
	{
		IntSet mySet = new IntSet(new int[] { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 });

		System.out.print("{");
		for(Iterator<Integer> iter = mySet.iterator(); iter.hasNext();)
		{
			System.out.print(iter.next());
			System.out.print(", ");
		}
		System.out.println("}");

		System.out.print("{");
		for(Integer iter: mySet)
		{
			System.out.print(iter);
			System.out.print(", ");
		}
		System.out.println("}");
	}
	
}
