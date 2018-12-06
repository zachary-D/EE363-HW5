public class UtilMethodGenerics
{
	static <T> void exchange(T[] container, int first, int second)
	{
		T swap = container[first];
		container[first] = container[second];
		container[second] = swap;
	}


}
